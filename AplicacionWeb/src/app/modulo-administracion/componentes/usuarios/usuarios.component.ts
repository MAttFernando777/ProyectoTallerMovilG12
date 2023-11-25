import { Component } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { VentanaUsuariosComponent } from './ventana-usuarios/ventana-usuarios.component';

@Component({
  selector: 'app-usuarios',
  templateUrl: './usuarios.component.html',
  styleUrls: ['./usuarios.component.css']
})
export class UsuariosComponent {
  public columnas: Array<string> = ['codigo', 'nombre', 'correo', 'opciones'];
  loading: boolean = false;

  constructor(
    private matDialog: MatDialog,){}

  agregar() {
    const dialogRef = this.matDialog.open(VentanaUsuariosComponent, {
      width: '550px',
      disableClose: true,
    });

  }
}
