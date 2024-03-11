import { RouterModule, Routes } from "@angular/router";
import { SystemComponent } from "./system.component";
import { ApplicationInitStatus, NgModule } from "@angular/core";
import { LegendsComponent } from "./legends/legends.component";
import { WeaponsComponent } from "./weapons/weapons.component";
import { EventsComponent } from "./events/events.component";
import { SkinsComponent } from "./skins/skins.component";
import { UsersComponent } from "./users/users.component";
import { ApplicationsComponent } from "./applications/applications.component";
import { LegendFullComponent } from "./legend-full/legend-full.component";
import { EventFullComponent } from "./event-full/event-full.component";
import { SkinFullComponent } from "./skin-full/skin-full.component";
import { ProfileComponent } from "./profile/profile.component";
import { AuthGuard } from "../shared/guards/auth.guard";

const routes: Routes = [
  {
    path: '',
    component: SystemComponent,
    canActivate: [AuthGuard],
    children: [
      { path: 'legends', component: LegendsComponent },
      { path: 'weapons', component: WeaponsComponent },
      { path: 'events', component: EventsComponent },
      { path: 'skins', component: SkinsComponent },
      { path: 'users', component: UsersComponent },
      { path: 'applications', component: ApplicationsComponent },
      { path: 'legend-full', component: LegendFullComponent },
      { path: 'event-full', component: EventFullComponent },
      { path: 'skin-full', component: SkinFullComponent },
      { path: 'profile', component: ProfileComponent },
    ],
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class SystemRoutingModule { }
