import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { UsuariosService } from '../../../servicios/usuarios.service';
import { MatDialogRef } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';

@Component({
  selector: 'app-ventana-usuarios',
  templateUrl: './ventana-usuarios.component.html',
  styleUrls: ['./ventana-usuarios.component.css']
})
export class VentanaUsuariosComponent implements OnInit {
  formReg: FormGroup;
  loading: boolean = false;
  operacion: string = 'Agregar ';

  constructor(
    private dialogRef: MatDialogRef<VentanaUsuariosComponent>,
    private usuariosService: UsuariosService,
    private _snackBar: MatSnackBar,
  ){
    this.formReg = new FormGroup({
      email: new FormControl(),
      password: new FormControl()
    })
  }

  ngOnInit(): void {
    
  }

  onSubmit() {
    this.usuariosService.register(this.formReg.value)
    .then(response => {
      console.log(response);
    })
    .catch(error => console.log(error));
    this.loading = false;
    this.dialogRef.close(true);
  }

  cancelar() {
    this.dialogRef.close(false);
  }

  mensajeExito(operacion: string) {
    this._snackBar.open(`El usuario fue ${operacion} con éxito`,'', {
      duration: 2000
    });
  }

  public CerrarVentana() {
    this.dialogRef.close();
  }
}
