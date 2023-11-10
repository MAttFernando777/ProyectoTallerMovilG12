import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { InicioComponent } from './componentes/inicio/inicio.component';
import { HomeComponent } from './componentes/home/home.component';
import { ConvocatoriasComponent } from './componentes/convocatorias/convocatorias.component';

const routes: Routes = [
  { 
    path: '' ,
    component: HomeComponent,
    children: [
      { path: '', redirectTo: 'inicio', pathMatch: 'full' },
      { path: 'inicio', component: InicioComponent },
      { path: 'convocatorias', component: ConvocatoriasComponent },
    ]
  } ,
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ModuloAdministracionRoutingModule { }