import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { InicioComponent } from './componentes/inicio/inicio.component';
import { HomeComponent } from './componentes/home/home.component';
import { ConvocatoriasComponent } from './componentes/convocatorias/convocatorias.component';
import { UsuariosComponent } from './componentes/usuarios/usuarios.component';
import { NoticiasComponent } from './componentes/noticias/noticias.component';
import { TramitesComponent } from './componentes/tramites/tramites.component';
import { ConferenciasComponent } from './componentes/conferencias/conferencias.component';

const routes: Routes = [
  { 
    path: '' ,
    component: HomeComponent,
    children: [
      { path: '', redirectTo: 'inicio', pathMatch: 'full' },
      { path: 'inicio', component: InicioComponent },
      { path: 'convocatorias', component: ConvocatoriasComponent },
      { path: 'usuarios', component: UsuariosComponent},
      { path: 'noticias', component: NoticiasComponent},
      { path: 'tramites', component: TramitesComponent},
      { path: 'conferencias', component: ConferenciasComponent},
    ]
  } ,
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ModuloAdministracionRoutingModule { }
