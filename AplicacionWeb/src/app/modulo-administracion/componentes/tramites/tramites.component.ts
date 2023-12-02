import { Component, OnInit, ViewChild } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { VentanaTramitesComponent } from './ventana-tramites/ventana-tramites.component';
import { MatDialog } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatTableDataSource } from '@angular/material/table';
import { Tramite } from '../../modelos/tramite.modelos';
import { TramiteService } from '../../servicios/tramite.service';
import { MatSort } from '@angular/material/sort';

@Component({
  selector: 'app-tramites',
  templateUrl: './tramites.component.html',
  styleUrls: ['./tramites.component.css']
})
export class TramitesComponent implements OnInit {
  public columnas: Array<string> = ['titulo', 'subtitulo', 'descripcion', 'fecha', 'opciones'];
  loading: boolean = false;
  dataSource: MatTableDataSource<Tramite>;
  @ViewChild(MatPaginator) paginator!: MatPaginator;
  @ViewChild(MatSort) sort!: MatSort;

  constructor(
    private _tramiteService: TramiteService,
    private matDialog: MatDialog,
    private _snackBar: MatSnackBar){
    this.dataSource = new MatTableDataSource();
  }

  ngOnInit(): void {
    this.obtenerTramites();
  }

  ngAfterViewInit(): void {
    this.dataSource.paginator = this.paginator;
    this.dataSource.sort = this.sort;
  }

  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();

    if (this.dataSource.paginator) {
      this.dataSource.paginator.firstPage();
    }
  }

  agregar(id?: number) {
    const dialogRef = this.matDialog.open( VentanaTramitesComponent, {
      width: '550px',
      disableClose: true,
      data: { id: id }
    });

    dialogRef.afterClosed().subscribe(result => {
      if(result) {
        this.obtenerTramites();
      }
    });
  }

  eliminar(id: number) {
    this.loading = true;
    setTimeout(() => {
      this._tramiteService.deleteTramite(id).subscribe(() => {
        this.obtenerTramites();
        this.mensajeExito();
      })
    }, 1000);
  }

  mensajeExito() {
    this._snackBar.open('El tramite fue eliminado con éxito','', {
      duration: 2000
    });
  }

  obtenerTramites() {
    this.loading = true;
    this._tramiteService.getTramites().subscribe(data => {
      this.loading = false;
      this.dataSource.data = data;
      this.dataSource.paginator = this.paginator;
      this.dataSource.sort = this.sort;
    })
  }
}
