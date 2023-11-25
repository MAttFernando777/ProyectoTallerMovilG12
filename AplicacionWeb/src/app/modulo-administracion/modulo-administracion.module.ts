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
    VentanaUsuariosComponent
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
