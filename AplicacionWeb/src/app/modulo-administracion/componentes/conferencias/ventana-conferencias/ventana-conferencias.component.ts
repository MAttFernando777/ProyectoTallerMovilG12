import { Component, Inject } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { ConferenciaService } from '../../../servicios/conferencia.service';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Conferencia } from '../../../modelos/conferencia.modelos';

@Component({
  selector: 'app-ventana-conferencias',
  templateUrl: './ventana-conferencias.component.html',
  styleUrls: ['./ventana-conferencias.component.css']
})
export class VentanaConferenciasComponent {
  form: FormGroup;
  operacion: string = 'Agregar ';
  id: number | undefined;
  loading: boolean = false;

  constructor(
    private fb: FormBuilder, 
    private dialogRef: MatDialogRef<VentanaConferenciasComponent>,
    private _conferenciaService: ConferenciaService,
    private _snackBar: MatSnackBar,
    @Inject(MAT_DIALOG_DATA) public data: any
  ) {
    this.form = this.fb.group({
      titulo: [{ value: '', disabled: false }, Validators.required],
      subtitulo: [{ value: '', disabled: false }, Validators.required],
      descripcion: [{ value: '', disabled: false }, Validators.required],
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
      this.getConferencia(id);
    }
  }

  getConferencia(id: number) {
    this._conferenciaService.getConferencia(id).subscribe(data => {
      this.form.setValue({
        titulo: data.titulo,
        subtitulo: data.subtitulo,
        descripcion: data.descripcion,
        fecha: new Date(data.fecha)
      })
    })
  }

  cancelar() {
    this.dialogRef.close(false);
  }

  addEditConferencia() {
    if (this.form.invalid) {
      return;
    }
    const conferencia: Conferencia = {
      titulo: this.form.value.titulo,
      subtitulo: this.form.value.subtitulo,
      descripcion: this.form.value.descripcion,
      fecha: this.form.value.fecha.toISOString().slice(0,10)
    }

    this.loading = true;

    if(this.id == undefined) {
      // Es agregar
      this._conferenciaService.addConferencia(conferencia).subscribe(() => {
        this.mensajeExito('agregada');
      })
    } else {
      // Es editar
      this._conferenciaService.updateConferencia(this.id, conferencia).subscribe(data => {
        this.mensajeExito('actualizada');
      })
    }
    this.loading = false;
    this.dialogRef.close(true);
  }

  mensajeExito(operacion: string) {
    this._snackBar.open(`La conferencia fue ${operacion} con éxito`,'', {
      duration: 2000
    });
  }

  public CerrarVentana() {
    this.dialogRef.close();
  }
}
