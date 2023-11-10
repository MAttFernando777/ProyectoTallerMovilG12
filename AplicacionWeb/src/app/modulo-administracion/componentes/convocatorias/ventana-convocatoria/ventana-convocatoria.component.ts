import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { FormBuilder, FormGroup, UntypedFormBuilder, UntypedFormGroup, Validators } from '@angular/forms';
import { MatSnackBar } from '@angular/material/snack-bar';
import { ConvocatoriaService } from '../../../servicios/convocatoria.service';
import { Convocatoria } from '../../../modelos/convocatoria.modelos';

@Component({
  selector: 'app-ventana-convocatoria',
  templateUrl: './ventana-convocatoria.component.html',
  styleUrls: ['./ventana-convocatoria.component.css']
})
export class VentanaConvocatoriaComponent implements OnInit {
  tipoDocumento: string[] = ['DNI', 'CREF', 'CEX'];
  form: FormGroup;
  operacion: string = 'Agregar ';
  id: number | undefined;
  loading: boolean = false;

  constructor(
    private dialogRef: MatDialogRef<VentanaConvocatoriaComponent>,
    private fb: FormBuilder, 
    private _convocatoriaService: ConvocatoriaService,
    private _snackBar: MatSnackBar,
    @Inject(MAT_DIALOG_DATA) public data: any
  ) {
    this.form = this.fb.group({
      logo: [{ value: 'https://cdn-icons-png.flaticon.com/512/899/899792.png', disabled: false}],
      empresa: [{ value: '', disabled: false }, Validators.required],
      puesto: [{ value: '', disabled: false }, Validators.required],
      salario: [{ value: '', disabled: false }, Validators.required],
      lugar: [{ value: null, disabled: false }, Validators.required],
      url: [{ value: null, disabled: false }, Validators.required],
      fecha: [{ value: null, disabled: false }, Validators.required],
    })
    this.id = data.id;
  }

  ngOnInit(): void {
    this.esEditar(this.id);
  }

  esEditar(id: number | undefined) {
    if(id !== undefined) {
      this.operacion = 'Editar ';
      this.getConvocatoria(id);
    }
  }

  getConvocatoria(id: number) {
    this._convocatoriaService.getConvocatoria(id).subscribe(data => {
      this.form.setValue({
        logo: data.logo,
        empresa: data.empresa,
        puesto: data.puesto,
        salario: data.salario,
        lugar: data.lugar,
        url: data.url,
        fecha: new Date(data.fecha)
      })
    })
  }
  
  cancelar() {
    this.dialogRef.close(false);
  }

  addEditConvocatoria() {
    if (this.form.invalid) {
      return;
    }
    const convocatoria: Convocatoria = {
      logo: this.form.value.logo,
      empresa: this.form.value.empresa,
      puesto: this.form.value.puesto,
      salario: this.form.value.salario,
      lugar: this.form.value.lugar,
      url: this.form.value.url,
      fecha: this.form.value.fecha.toISOString().slice(0,10)
    }

    this.loading = true;

    if(this.id == undefined) {
      // Es agregar
      this._convocatoriaService.addConvocatoria(convocatoria).subscribe(() => {
        this.mensajeExito('agregada');
      })
    } else {
      // Es editar
      this._convocatoriaService.updateConvocatoria(this.id, convocatoria).subscribe(data => {
        this.mensajeExito('actualizada');
      })
    }
    this.loading = false;
    this.dialogRef.close(true);
  }

  mensajeExito(operacion: string) {
    this._snackBar.open(`La convocatoria fue ${operacion} con éxito`,'', {
      duration: 2000
    });
  }

  public CerrarVentana() {
    this.dialogRef.close();
  }
}

export type InformacionVentanaConvocatoria = {
  tipo_vista: 'ver' | 'editar';
  convocatoria?: Convocatoria;
};