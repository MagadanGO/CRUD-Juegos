using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace JuegosDeMesa.Models.Request
{
    public class ProductoRequest
    {
        public int id { get; set; }
        [Required]
        public string nombre { get; set; }
        [Required]
        public string descripción { get; set; }
        [Required]
        public decimal precio { get; set; }
        public byte[] imagen { get; set; }
    }
}
