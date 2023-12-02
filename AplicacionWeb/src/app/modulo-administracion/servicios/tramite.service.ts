import { Injectable } from '@angular/core';
import { Tramite } from '../modelos/tramite.modelos';
import { Observable } from 'rxjs';
import { environment } from '../../../environments/environment';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class TramiteService {
  private myAppUrl: string; 
  private myApiUrl: string;

  constructor(private http: HttpClient) {
    this.myAppUrl = environment.endpoint;
    this.myApiUrl = 'api/tramites/'
  }

  getTramites(): Observable<Tramite[]> {
    return this.http.get<Tramite[]>(`${this.myAppUrl}${this.myApiUrl}`)
  }

  deleteTramite(id: number): Observable<void> {
    return this.http.delete<void>(`${this.myAppUrl}${this.myApiUrl}${id}`);
  }

  addTramite(tramite: Tramite): Observable<void> {
    return this.http.post<void>(`${this.myAppUrl}${this.myApiUrl}`, tramite);
  }

  getTramite(id: number): Observable<Tramite> {
    return this.http.get<Tramite>(`${this.myAppUrl}${this.myApiUrl}${id}`)
  }

  updateTramite(id: number, tramite: Tramite): Observable<void> {
    return this.http.put<void>(`${this.myAppUrl}${this.myApiUrl}${id}`, tramite)
  }
}
