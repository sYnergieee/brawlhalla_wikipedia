import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { NotFoundPageComponent } from './not-found-page/not-found-page.component';

const routes: Routes = [
  {
    path: '',
    redirectTo: 'auth/login',
    pathMatch: 'full',
  },
  {
    path: 'system',
    loadChildren: () =>
      import('./system/system.module').then((m) => m.SystemModule),
  },
  { path: 'not_found', pathMatch: 'full', component: NotFoundPageComponent },
  { path: '**', pathMatch: 'full', component: NotFoundPageComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
