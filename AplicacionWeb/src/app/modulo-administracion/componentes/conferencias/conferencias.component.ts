import { Component, OnInit, ViewChild } from '@angular/core';
import { Conferencia } from '../../modelos/conferencia.modelos';
import { VentanaConferenciasComponent } from './ventana-conferencias/ventana-conferencias.component';
import { MatTableDataSource } from '@angular/material/table';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatDialog } from '@angular/material/dialog';
import { MatPaginator } from '@angular/material/paginator';
import { ConferenciaService } from '../../servicios/conferencia.service';

@Component({
  selector: 'app-conferencias',
  templateUrl: './conferencias.component.html',
  styleUrls: ['./conferencias.component.css']
})
export class ConferenciasComponent implements OnInit {
  loading: boolean = false;
  public columnas: Array<string> = ['titulo','subtitulo','descripcion', 'fecha', 'opciones'];
  dataSource: MatTableDataSource<Conferencia>;
  @ViewChild(MatPaginator) paginator!: MatPaginator;

  constructor(
    private _conferenciaService: ConferenciaService,
    private matDialog: MatDialog,
    private _snackBar: MatSnackBar){
    this.dataSource = new MatTableDataSource();
  }

  ngOnInit(): void {
    this.obtenerConferencias();
  }

  agregar(id?: number) {
    const dialogRef = this.matDialog.open(VentanaConferenciasComponent, {
      width: '550px',
      disableClose: true,
      data: { id: id }
    });

    dialogRef.afterClosed().subscribe(result => {
      if(result) {
        this.obtenerConferencias();
      }
    });
  }

  eliminar(id: number) {
    this.loading = true;
    setTimeout(() => {
      this._conferenciaService.deleteConferencia(id).subscribe(() => {
        this.obtenerConferencias();
        this.mensajeExito();
      })
    }, 1000);
  }

  mensajeExito() {
    this._snackBar.open('La conferencia fue eliminada con éxito','', {
      duration: 2000
    });
  }

  obtenerConferencias(){
    this.loading = true;
    this._conferenciaService.getConferencias().subscribe(data => {
      this.loading = false;
      this.dataSource.data = data;
      this.dataSource.paginator = this.paginator;
    })
  }
}
