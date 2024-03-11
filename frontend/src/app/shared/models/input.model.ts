import { Observable } from 'rxjs';

export type Input = {
  type?: any;
  label?: string;
  formControl?: any;
  messageError?: () => string;
  placeholder?: any;
  hide?: boolean;
  icon?: string;
};
export type SelectInput = {
  field: string;
  type: any;
  label: string;
  formControl: any;
  messageError?: () => string;
  values?: Observable<any[]>;
  placeholder?: any;
  icon?: string;
  onClick?: (p:any) => void;
  hide?: boolean;
};
