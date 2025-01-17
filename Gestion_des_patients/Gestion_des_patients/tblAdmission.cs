//------------------------------------------------------------------------------
// <auto-generated>
//     Ce code a été généré à partir d'un modèle.
//
//     Des modifications manuelles apportées à ce fichier peuvent conduire à un comportement inattendu de votre application.
//     Les modifications manuelles apportées à ce fichier sont remplacées si le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Gestion_des_patients
{
    using System;
    using System.Collections.Generic;
    using System.Linq;

    public partial class tblAdmission
    {
        public int IDAdmission { get; set; }
        public Nullable<bool> chirurgie_programmé { get; set; }
        public Nullable<System.DateTime> date_admission { get; set; }
        public Nullable<System.DateTime> date_chirurgie { get; set; }
        public Nullable<System.DateTime> date_congé { get; set; }
        public bool téléviseur { get; set; }
        public bool téléphone { get; set; }
        public int NSS { get; set; }
        public int Numérolit { get; set; }
        public int IDMédecin { get; set; }
    
        public virtual tblLit tblLit { get; set; }
        public virtual tblMedecin tblMedecin { get; set; }
        public virtual tblPatient tblPatient { get; set; }

        public tblAdmission(int iDAdmission, bool? chirurgie_programmé, DateTime? date_admission, DateTime? date_chirurgie,
           DateTime? date_congé, bool téléviseur, bool téléphone, int nSS, int numérolit, int iDMédecin)
        {
            IDAdmission = iDAdmission;
            this.chirurgie_programmé = chirurgie_programmé;
            this.date_admission = date_admission;
            this.date_chirurgie = date_chirurgie;
            this.date_congé = date_congé;
            this.téléviseur = téléviseur;
            this.téléphone = téléphone;
            NSS = nSS;
            Numérolit = numérolit;
            IDMédecin = iDMédecin;
        }

        public tblAdmission()
        {
        }


        public static void Validation_ID_Date_admission(string IDAdmis, DateTime? dateAdmis)
        {

            if ((IDAdmis == string.Empty) || (IDAdmis == null))
                throw new Valid_ID_admissionException();



            int q = (from c in Menu.myBDD.tblAdmissions.ToList() where c.IDAdmission == int.Parse(IDAdmis) select c.IDAdmission).FirstOrDefault();
            if (q != 0)
                throw new Valid_ID_admission_insertionException();

            if (dateAdmis == null)
                throw new Valid_Date_admissionException();

        }

        public static void Valid_Date_Chirurgie(bool programmation_chirurgie, DateTime? datechirurgie)
        {


            if (programmation_chirurgie == true && datechirurgie == null)

                throw new Valid_Date_ChirurgieException();

            if (programmation_chirurgie == false && datechirurgie != null)

                throw new Valid_programmation_chirurgieException();
        }


    }
}
