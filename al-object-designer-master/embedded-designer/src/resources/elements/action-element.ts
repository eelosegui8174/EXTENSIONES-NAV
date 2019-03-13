import { bindable, autoinject, bindingMode } from 'aurelia-framework';
import { ObjectElementBase } from './object-element-base';

@autoinject
export class ActionElement extends ObjectElementBase {
    
    @bindable control: any;

    constructor(element: Element) {
        super(element);
    }

    bind(bindingContext: Object,overrideContext: Object) {
        this.dragOptions.group = `actions`;
    }

    getControlKind(index: number) {
        return ActionKind[index];
    }
}

export enum ActionKind {
    Area,
    Group,
    Action,
    Separator
}
