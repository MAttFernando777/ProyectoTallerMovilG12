import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Auth, createUserWithEmailAndPassword } from '@angular/fire/auth';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class UsuariosService {

  constructor(private auth: Auth, private http: HttpClient) { }

  register({email, password} : any){
    return createUserWithEmailAndPassword(this.auth, email, password);
  }

  /* getUsers(): Observable<any[]> {
    return this.http.get<any[]>(`${this.apiUrl}/getUsers`);
  } */
}
