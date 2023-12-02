import { Component, Inject } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { TramiteService } from '../../../servicios/tramite.service';
import { Tramite } from '../../../modelos/tramite.modelos';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';

@Component({
  selector: 'app-ventana-tramites',
  templateUrl: './ventana-tramites.component.html',
  styleUrls: ['./ventana-tramites.component.css']
})
export class VentanaTramitesComponent {
  form: FormGroup;
  operacion: string = 'Agregar ';
  id: number | undefined;
  loading: boolean = false;

  constructor(
    private fb: FormBuilder, 
    private dialogRef: MatDialogRef<VentanaTramitesComponent>,
    private _tramiteService: TramiteService,
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
      this.getTramite(id);
    }
  }

  getTramite(id: number) {
    this._tramiteService.getTramite(id).subscribe(data => {
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

  addEditTramite() {
    if (this.form.invalid) {
      return;
    }
    const tramite: Tramite = {
      titulo: this.form.value.titulo,
      subtitulo: this.form.value.subtitulo,
      descripcion: this.form.value.descripcion,
      fecha: this.form.value.fecha.toISOString().slice(0,10)
    }

    this.loading = true;

    if(this.id == undefined) {
      // Es agregar
      this._tramiteService.addTramite(tramite).subscribe(() => {
        this.mensajeExito('agregado');
      })
    } else {
      // Es editar
      this._tramiteService.updateTramite(this.id, tramite).subscribe(data => {
        this.mensajeExito('actualizado');
      })
    }
    this.loading = false;
    this.dialogRef.close(true);
  }

  mensajeExito(operacion: string) {
    this._snackBar.open(`El tramite fue ${operacion} con éxito`,'', {
      duration: 2000
    });
  }

  public CerrarVentana() {
    this.dialogRef.close();
  }
}

export type InformacionVentanaTramite = {
  tipo_vista: 'ver' | 'editar';
  tramite?: Tramite;
};
