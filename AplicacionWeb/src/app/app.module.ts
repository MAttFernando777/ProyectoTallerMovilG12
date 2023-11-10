import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { ModuloAdministracionModule } from './modulo-administracion/modulo-administracion.module';
import { MAT_DATE_LOCALE } from '@angular/material/core';

@NgModule({
  declarations: [
    AppComponent,
    
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    AppRoutingModule,
    ModuloAdministracionModule,
  ],
  providers: [
    {
      provide: MAT_DATE_LOCALE, useValue: 'es'
    }
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
