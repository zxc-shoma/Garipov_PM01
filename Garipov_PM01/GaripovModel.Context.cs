﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class PolyclinicEntities : DbContext
    {
        public PolyclinicEntities()
            : base("name=PolyclinicEntities")
        {
        }

        public static PolyclinicEntities _context;
        public static PolyclinicEntities GetContext()

        {
            if (_context == null)
                _context = new PolyclinicEntities();
            return _context;
        }
        



    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<DEPARTAMENT> DEPARTAMENT { get; set; }
        public virtual DbSet<DIAGNOSIS> DIAGNOSIS { get; set; }
        public virtual DbSet<DOCTORS> DOCTORS { get; set; }
        public virtual DbSet<MEDICAL_HISTORY> MEDICAL_HISTORY { get; set; }
        public virtual DbSet<PATIENTS> PATIENTS { get; set; }
    }
}