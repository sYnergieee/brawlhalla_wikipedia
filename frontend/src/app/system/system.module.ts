import { CommonModule } from "@angular/common";
import { NgModule } from "@angular/core";
import { SystemComponent } from "./system.component";
import { FormsModule } from "@angular/forms";
import { SharedModule } from "../shared/shared.module";
import { FooterComponent } from './shared/footer/footer.component';
import { HeaderComponent } from './shared/header/header.component';
import { LegendsComponent } from './legends/legends.component';
import { SystemRoutingModule } from "./system-routing.module";
import { SkinsComponent } from './skins/skins.component';
import { UsersComponent } from './users/users.component';
import { WeaponsComponent } from './weapons/weapons.component';
import { EventsComponent } from './events/events.component';
import { ApplicationsComponent } from './applications/applications.component';
import { LegendFullComponent } from './legend-full/legend-full.component';
import { EventFullComponent } from './event-full/event-full.component';
import { SkinFullComponent } from './skin-full/skin-full.component';
import { ProfileComponent } from './profile/profile.component';
import { DialogChangeReviewComponent } from "./shared/dialog-change-review/dialog-change-review.component";
import { DialogChangeLegendComponent } from "./shared/dialog-change-legend/dialog-change-legend.component";
import { DialogChangeSkinComponent } from "./shared/dialog-change-skin/dialog-change-skin.component";

@NgModule({
  declarations: [
    SystemComponent,
    FooterComponent,
    HeaderComponent,
    LegendsComponent,
    SkinsComponent,
    UsersComponent,
    WeaponsComponent,
    EventsComponent,
    ApplicationsComponent,
    LegendFullComponent,
    EventFullComponent,
    SkinFullComponent,
    ProfileComponent,
    DialogChangeReviewComponent,
    DialogChangeLegendComponent,
    DialogChangeSkinComponent
  ],
  imports: [
    CommonModule,
    SharedModule,
    FormsModule,
    SystemRoutingModule,
  ],
  providers: [],
})
export class SystemModule { }