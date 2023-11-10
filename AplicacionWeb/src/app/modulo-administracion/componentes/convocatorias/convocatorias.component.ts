import { AfterViewInit, Component, OnInit, ViewChild } from '@angular/core';
import { MatTableDataSource } from '@angular/material/table';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatDialog } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { VentanaConvocatoriaComponent } from './ventana-convocatoria/ventana-convocatoria.component';
import { Convocatoria } from '../../modelos/convocatoria.modelos';
import { ConvocatoriaService } from '../../servicios/convocatoria.service';

@Component({
  selector: 'app-convocatorias',
  templateUrl: './convocatorias.component.html',
  styleUrls: ['./convocatorias.component.css']
})
export class ConvocatoriasComponent implements OnInit, AfterViewInit {
  public columnas: Array<string> = ['empresa', 'puesto', 'salario' , 'lugar', 'url', 'fecha', 'opciones'];
  dataSource: MatTableDataSource<Convocatoria>;
  loading: boolean = false;
  @ViewChild(MatPaginator) paginator!: MatPaginator;
  @ViewChild(MatSort) sort!: MatSort;

  constructor(
    private _convocatoriaService: ConvocatoriaService,
    private matDialog: MatDialog,
    private _snackBar: MatSnackBar){
    this.dataSource = new MatTableDataSource();
  }

  ngOnInit(): void {
    this.obtenerConvocatorias();
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
    const dialogRef = this.matDialog.open(VentanaConvocatoriaComponent, {
      width: '550px',
      disableClose: true,
      data: { id: id }
    });

    dialogRef.afterClosed().subscribe(result => {
      if(result) {
        this.obtenerConvocatorias();
      }
    });
  }

  eliminar(id: number) {
    this.loading = true;
    setTimeout(() => {
      this._convocatoriaService.deleteConvocatoria(id).subscribe(() => {
        this.obtenerConvocatorias();
        this.mensajeExito();
      })
    }, 1000);
  }

  mensajeExito() {
    this._snackBar.open('La convocatoria fue eliminada con éxito','', {
      duration: 2000
    });
  }

  obtenerConvocatorias() {
    this.loading = true;
    this._convocatoriaService.getConvocatorias().subscribe(data => {
      this.loading = false;
      this.dataSource.data = data;
      this.dataSource.paginator = this.paginator;
      this.dataSource.sort = this.sort;
    })
  }
}
