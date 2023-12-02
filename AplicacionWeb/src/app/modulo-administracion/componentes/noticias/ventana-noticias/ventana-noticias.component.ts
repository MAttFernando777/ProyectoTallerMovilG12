import { Component, Inject } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { NoticiaService } from '../../../servicios/noticia.service';
import { Noticia } from '../../../modelos/noticia.modelos';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';

@Component({
  selector: 'app-ventana-noticias',
  templateUrl: './ventana-noticias.component.html',
  styleUrls: ['./ventana-noticias.component.css']
})
export class VentanaNoticiasComponent {
  form: FormGroup;
  operacion: string = 'Agregar ';
  id: number | undefined;
  loading: boolean = false;

  constructor(
    private fb: FormBuilder, 
    private dialogRef: MatDialogRef<VentanaNoticiasComponent>,
    private _noticiaService: NoticiaService,
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
      this.getNoticia(id);
    }
  }

  getNoticia(id: number) {
    this._noticiaService.getNoticia(id).subscribe(data => {
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

  addEditNoticia() {
    if (this.form.invalid) {
      return;
    }
    const noticia: Noticia = {
      titulo: this.form.value.titulo,
      subtitulo: this.form.value.subtitulo,
      descripcion: this.form.value.descripcion,
      fecha: this.form.value.fecha.toISOString().slice(0,10)
    }

    this.loading = true;

    if(this.id == undefined) {
      // Es agregar
      this._noticiaService.addNoticia(noticia).subscribe(() => {
        this.mensajeExito('agregada');
      })
    } else {
      // Es editar
      this._noticiaService.updateNoticia(this.id, noticia).subscribe(data => {
        this.mensajeExito('actualizada');
      })
    }
    this.loading = false;
    this.dialogRef.close(true);
  }

  mensajeExito(operacion: string) {
    this._snackBar.open(`La noticia fue ${operacion} con éxito`,'', {
      duration: 2000
    });
  }

  public CerrarVentana() {
    this.dialogRef.close();
  }
}

export type InformacionVentanaNoticia = {
  tipo_vista: 'ver' | 'editar';
  noticia?: Noticia;
};