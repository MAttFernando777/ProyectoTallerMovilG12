import { Injectable } from '@angular/core';
import { Noticia } from '../modelos/noticia.modelos';
import { Observable } from 'rxjs';
import { environment } from '../../../environments/environment';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class NoticiaService {
  private myAppUrl: string; 
  private myApiUrl: string;

  constructor(private http: HttpClient) {
    this.myAppUrl = environment.endpoint;
    this.myApiUrl = 'api/noticias/'
  }

  getNoticias(): Observable<Noticia[]> {
    return this.http.get<Noticia[]>(`${this.myAppUrl}${this.myApiUrl}`)
  }

  deleteNoticia(id: number): Observable<void> {
    return this.http.delete<void>(`${this.myAppUrl}${this.myApiUrl}${id}`);
  }

  addNoticia(noticia: Noticia): Observable<void> {
    return this.http.post<void>(`${this.myAppUrl}${this.myApiUrl}`, noticia);
  }

  getNoticia(id: number): Observable<Noticia> {
    return this.http.get<Noticia>(`${this.myAppUrl}${this.myApiUrl}${id}`)
  }

  updateNoticia(id: number, noticia: Noticia): Observable<void> {
    return this.http.put<void>(`${this.myAppUrl}${this.myApiUrl}${id}`, noticia)
  }
}
