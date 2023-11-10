import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Convocatoria } from '../modelos/convocatoria.modelos';
import { environment } from '../../../environments/environment';
@Injectable({
  providedIn: 'root'
})
export class ConvocatoriaService {
  private myAppUrl: string; 
  private myApiUrl: string;

  constructor(private http: HttpClient) {
    this.myAppUrl = environment.endpoint;
    this.myApiUrl = 'api/convocatorias/'
  }

  getConvocatorias(): Observable<Convocatoria[]> {
    return this.http.get<Convocatoria[]>(`${this.myAppUrl}${this.myApiUrl}`)
  }

  deleteConvocatoria(id: number): Observable<void> {
    return this.http.delete<void>(`${this.myAppUrl}${this.myApiUrl}${id}`);
  }

  addConvocatoria(convocatoria: Convocatoria): Observable<void> {
    return this.http.post<void>(`${this.myAppUrl}${this.myApiUrl}`, convocatoria);
  }

  getConvocatoria(id: number): Observable<Convocatoria> {
    return this.http.get<Convocatoria>(`${this.myAppUrl}${this.myApiUrl}${id}`)
  }

  updateConvocatoria(id: number, convocatoria: Convocatoria): Observable<void> {
    return this.http.put<void>(`${this.myAppUrl}${this.myApiUrl}${id}`, convocatoria)
  }
}
