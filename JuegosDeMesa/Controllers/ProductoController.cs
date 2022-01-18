using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace JuegosDeMesa.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [EnableCors("permitir")]

    public class ProductoController : ControllerBase
    {
        [HttpGet]
        public ActionResult Get()
        {
            using(Models.bdGBContext bd = new Models.bdGBContext())
            {
                var lst = (from d in bd.Productos
                           select d).ToList();

                return Ok(lst);
            }
        }

        [HttpGet("{id}")]
        public ActionResult GetID(int id)
        {
            using (Models.bdGBContext bd = new Models.bdGBContext())
            {
                Models.Producto prod = bd.Productos.Find(id);

                return Ok(prod);
            }
        }

        [HttpPost]
        public ActionResult Post([FromBody] Models.Request.ProductoRequest p)
        {
            using (Models.bdGBContext bd = new Models.bdGBContext())
            {
                Models.Producto prod = new Models.Producto();
                prod.Nombre = p.nombre;
                prod.Descripción = p.descripción;
                prod.Precio = p.precio;
                prod.Imagen = p.imagen;
                bd.Productos.Add(prod);

                bd.SaveChanges();
            }

            return Ok();
        }

        [HttpPut("{id}")]
        public ActionResult Put(int id,[FromBody] Models.Request.ProductoRequest p)
        {
            using (Models.bdGBContext bd = new Models.bdGBContext())
            {
                Models.Producto prod = bd.Productos.Find(id);
                prod.Nombre = p.nombre;
                prod.Descripción = p.descripción;
                prod.Precio = p.precio;
                prod.Imagen = p.imagen;
                bd.Entry(prod).State = Microsoft.EntityFrameworkCore.EntityState.Modified;

                bd.SaveChanges();
            }

            return Ok();
        }

        [HttpDelete("{id}")]
        public ActionResult Delete(int id)
        {
            using (Models.bdGBContext bd = new Models.bdGBContext())
            {
                Models.Producto prod = bd.Productos.Find(id);
                bd.Productos.Remove(prod);
                //bd.Entry(prod).State = Microsoft.EntityFrameworkCore.EntityState.Modified);

                bd.SaveChanges();
            }

            return Ok();
        }

    }
}
