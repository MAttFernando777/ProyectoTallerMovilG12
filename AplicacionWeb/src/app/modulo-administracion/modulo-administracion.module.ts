import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MenuComponent } from './componentes/menu/menu.component';
import { ModuloAdministracionRoutingModule } from './modulo-administracion-routing.module';
import { MaterialModule } from '../material/material.module';
import { InicioComponent } from './componentes/inicio/inicio.component';
import { HomeComponent } from './componentes/home/home.component';
import { DatosUsuarioComponent } from './componentes/datos-usuario/datos-usuario.component';
import { ToolbarGeneralComponent } from './componentes/toolbar-general/toolbar-general.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { ConvocatoriasComponent } from './componentes/convocatorias/convocatorias.component';
import { VentanaConvocatoriaComponent } from './componentes/convocatorias/ventana-convocatoria/ventana-convocatoria.component';
import { UsuariosComponent } from './componentes/usuarios/usuarios.component';
import { VentanaUsuariosComponent } from './componentes/usuarios/ventana-usuarios/ventana-usuarios.component';
import { NoticiasComponent } from './componentes/noticias/noticias.component';
import { TramitesComponent } from './componentes/tramites/tramites.component';
import { ConferenciasComponent } from './componentes/conferencias/conferencias.component';
import { VentanaNoticiasComponent } from './componentes/noticias/ventana-noticias/ventana-noticias.component';
import { VentanaTramitesComponent } from './componentes/tramites/ventana-tramites/ventana-tramites.component';
import { VentanaConferenciasComponent } from './componentes/conferencias/ventana-conferencias/ventana-conferencias.component';

@NgModule({
  declarations: [
    MenuComponent,
    InicioComponent,
    HomeComponent,
    DatosUsuarioComponent,
    ToolbarGeneralComponent,
    ConvocatoriasComponent,
    VentanaConvocatoriaComponent,
    UsuariosComponent,
    VentanaUsuariosComponent,
    NoticiasComponent,
    TramitesComponent,
    ConferenciasComponent,
    VentanaNoticiasComponent,
    VentanaTramitesComponent,
    VentanaConferenciasComponent
  ],
  imports: [
    MaterialModule,
    CommonModule,
    ModuloAdministracionRoutingModule,
    FormsModule,
    ReactiveFormsModule,
    HttpClientModule
  ],
  exports: [
    HttpClientModule
  ]
})
export class ModuloAdministracionModule { }
