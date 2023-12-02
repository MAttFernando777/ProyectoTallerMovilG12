import { Injectable } from '@angular/core';
import { environment } from '../../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Conferencia } from '../modelos/conferencia.modelos';

@Injectable({
  providedIn: 'root'
})
export class ConferenciaService {
  private myAppUrl: string; 
  private myApiUrl: string;

  constructor(private http: HttpClient) {
    this.myAppUrl = environment.endpoint;
    this.myApiUrl = 'api/conferencias/'
  }

  getConferencias(): Observable<Conferencia[]> {
    return this.http.get<Conferencia[]>(`${this.myAppUrl}${this.myApiUrl}`)
  }

  deleteConferencia(id: number): Observable<void> {
    return this.http.delete<void>(`${this.myAppUrl}${this.myApiUrl}${id}`);
  }

  addConferencia(conferencia: Conferencia): Observable<void> {
    return this.http.post<void>(`${this.myAppUrl}${this.myApiUrl}`, conferencia);
  }

  getConferencia(id: number): Observable<Conferencia> {
    return this.http.get<Conferencia>(`${this.myAppUrl}${this.myApiUrl}${id}`)
  }

  updateConferencia(id: number, conferencia: Conferencia): Observable<void> {
    return this.http.put<void>(`${this.myAppUrl}${this.myApiUrl}${id}`, conferencia)
  }
}
