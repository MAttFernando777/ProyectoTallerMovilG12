import { Component, OnInit, ViewChild } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatTableDataSource } from '@angular/material/table';
import { VentanaNoticiasComponent } from './ventana-noticias/ventana-noticias.component';
import { Noticia } from '../../modelos/noticia.modelos';
import { MatPaginator } from '@angular/material/paginator';
import { NoticiaService } from '../../servicios/noticia.service';

@Component({
  selector: 'app-noticias',
  templateUrl: './noticias.component.html',
  styleUrls: ['./noticias.component.css']
})
export class NoticiasComponent implements OnInit {
  loading: boolean = false;
  public columnas: Array<string> = ['titulo','subtitulo','descripcion', 'fecha', 'opciones'];
  dataSource: MatTableDataSource<Noticia>;
  @ViewChild(MatPaginator) paginator!: MatPaginator;

  constructor(
    private _noticiaService: NoticiaService,
    private matDialog: MatDialog,
    private _snackBar: MatSnackBar){
    this.dataSource = new MatTableDataSource();
  }

  ngOnInit(): void {
    this.obtenerNoticias();
  }

  agregar(id?: number) {
    const dialogRef = this.matDialog.open(VentanaNoticiasComponent, {
      width: '550px',
      disableClose: true,
      data: { id: id }
    });

    dialogRef.afterClosed().subscribe(result => {
      if(result) {
        this.obtenerNoticias();
      }
    });
  }

  eliminar(id: number) {
    this.loading = true;
    setTimeout(() => {
      this._noticiaService.deleteNoticia(id).subscribe(() => {
        this.obtenerNoticias();
        this.mensajeExito();
      })
    }, 1000);
  }

  mensajeExito() {
    this._snackBar.open('La noticia fue eliminada con éxito','', {
      duration: 2000
    });
  }

  obtenerNoticias(){
    this.loading = true;
    this._noticiaService.getNoticias().subscribe(data => {
      this.loading = false;
      this.dataSource.data = data;
      this.dataSource.paginator = this.paginator;
    })
  }
}
