//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Garipov_PM01
{
    using System;
    using System.Collections.Generic;
    
    public partial class MEDICAL_HISTORY
    {
        public int HISTORY_ID { get; set; }
        public int HISTORY_DOCTOR_ID { get; set; }
        public int HISTORY_PATIENT_ID { get; set; }
        public int HISTORY_DIAGNOSIS_ID { get; set; }
        public string HISTORY_TREATMENT { get; set; }
        public System.DateTime HISTORY_DATE_OFF_ILLNESS { get; set; }
        public Nullable<System.DateTime> HISTORY_DATE_OFF_RECOVERY { get; set; }
        public string HISTORY_TYPE_OFF_TREARMENT { get; set; }
    
        public virtual DIAGNOSIS DIAGNOSIS { get; set; }
        public virtual DOCTORS DOCTORS { get; set; }
        public virtual PATIENTS PATIENTS { get; set; }
    }
}
