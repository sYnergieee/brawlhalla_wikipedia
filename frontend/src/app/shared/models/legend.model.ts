export class WeaponPostModel {
    constructor(public name: any, public img: any) { }
}
export class LegendPostModel {
    constructor(public name: any, public aka_name: any, public description: any,
        public cost: any, public img_main: any, public img_short: any, public release_info: any, public weapons: any,
        public stats: any) { }
}
export class LegendWeaponPostModel {
    constructor(public weapon_id: any, public name: any, public img: any) { }
}
export class LegendStatPostModel {
    constructor(public stat_id: any, public value: any) { }
}
export class LegendPutModel {
    constructor(public name: any, public aka_name: any, public description: any,
        public cost: any, public img_main: any, public img_short: any, public release_info: any, public weapons: any,
        public stats: any, public id: any) { }
}
