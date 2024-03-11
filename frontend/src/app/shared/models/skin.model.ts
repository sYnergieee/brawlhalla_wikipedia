export class SkinPutModel {
    constructor(public name: any, public img: any, public is_crossover: any, public is_exclusive: any, public cost: any, public purshase_info: any, public weapons: any, public chests: any, public events: any, public id: any) { }
}
export class SkinPostModel {
    constructor(public name: any, public img: any, public is_crossover: any, public is_exclusive: any, public cost: any, public purshase_info: any, public weapons: any, public chests: any, public events: any, public legend_id: any) { }
}
export class SkinChestModel {
    constructor(public chest_id: any) { }
}
export class SkinEventModel {
    constructor(public event_id: any) { }
}