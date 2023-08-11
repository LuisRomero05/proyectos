﻿using AHM.Logistic.Smart.BusinessLogic.Services;
using AHM.Logistic.Smart.Common.Models;
using AHM.Logistic.Smart.Entities.Entities;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;


namespace AHM.Logistic.Smart.Api.Controllers
{

        [Route("api/[controller]")]
        [ApiController]
        [Authorize] 
        public class DepartmentsController : ControllerBase
        {
            private readonly IMapper _mapper;
            private readonly CatalogService _catalogServices;
            public DepartmentsController(CatalogService catalogServices, IMapper mapper)
            {
                _mapper = mapper;
                _catalogServices = catalogServices;
            }

        // POST: api/Departments/List
        /// <summary>
        /// End point para visualizar los registros de la tabla "Departments".
        /// </summary>
        /// <remarks>
        /// Se mostraran todos los registros de la tabla "Departments" sin requerir de ningun dato a ingresar.
        /// </remarks>
        /// <response code="200">Success. Los valores son correctos y se han agregado exitosamente.</response>
        /// <response code="401">Unauthorized. No se ha indicado o es incorrecto el Token JTW de acceso.</response>
        /// <response code="400">Bad Request. La informacion ingresada no es la correcta o el proceso no existe.</response>
        [HttpGet("List")]
            public IActionResult List()
            {
                var result = _catalogServices.ListDepartments();
                return Ok(result);
            }


        // GET: api/Departments/Details
        /// <summary>
        /// End point para visualizar el registro de la tabla "Departments" segun el Id ingresado.
        /// </summary>
        /// <remarks>
        /// Se mostrara el registro de la tabla "Departments" segun el Id ingresado.
        /// </remarks>
        /// <response code="200">Success. Los valores son correctos y se han agregado exitosamente.</response>
        /// <response code="401">Unauthorized. No se ha indicado o es incorrecto el Token JTW de acceso.</response>
        /// <response code="400">Bad Request. La informacion ingresada no es la correcta o el proceso no existe.</response>
        [HttpGet("Details/{Id}")]
        public IActionResult Details(int Id)
        {
            var IdFind = Id;
            var result = _catalogServices.FindDepartments(x => x.dep_Id == Id);
            return Ok(result);
        }


        // POST: api/Departments/Insert
        /// <summary>
        /// End point para registrar un departamento nuevo.
        /// </summary>
        /// <remarks>
        /// Se deben ingresar los datos correspondientes con el tipo solicitado. Colocar Id's existentes y que correspondan a lo que se le quiere asignar al Departamento.
        /// </remarks>
        /// <param name="items">Items es la entidad que contiene los datos que se solicitan.</param>
        /// <response code="200">Success. Los valores son correctos y se han agregado exitosamente.</response>
        /// <response code="401">Unauthorized. No se ha indicado o es incorrecto el Token JTW de acceso.</response>
        /// <response code="400">Bad Request. La informacion ingresada no es la correcta o el proceso no existe.</response>
        [HttpPost("Insert")]
        //[SwaggerRequestExample(typeof(CategoryModel), typeof(CategoryExample))]
        public IActionResult Insert(DepartmentsModel items)
        {
            var item = _mapper.Map<tbDepartments>(items);
            var result = _catalogServices.RegisterDepartment(item);
            if (!result.Success)
                return Conflict(result);
            return Ok(result);
        }


        // POST: api/Departments/Update
        /// <summary>
        /// End point para actualizar un departamento existente.
        /// </summary>
        /// <remarks>
        /// Colocar el Id del registro a actualizar y llenar los campos correspondientes.
        /// </remarks>
        /// <param name="items">Items es la entidad que contiene los datos que se solicitan.</param>
        /// <param name="Id">Id es el parametro mediante el cual se encuentra el registro a actualizar.</param>
        /// <response code="200">Success. Los valores son correctos y se han agregado exitosamente.</response>
        /// <response code="401">Unauthorized. No se ha indicado o es incorrecto el Token JTW de acceso.</response>
        /// <response code="400">Bad Request. La informacion ingresada no es la correcta o el proceso no existe.</response>
        [HttpPut("Update/{Id}")]
        public IActionResult Update(int Id, DepartmentsModel items)
        {
            var item = _mapper.Map<tbDepartments>(items);
            var IdUser = Id;
            var result = _catalogServices.UpdateDepartments(IdUser, item);
            if (!result.Success)
                return Conflict(result);
            return Ok(result);
        }

        // POST: api/Departments/Delete
        /// <summary>
        /// End point para eliminar un departamento existente.
        /// </summary>
        /// <remarks>
        /// Colocar el Id del registro a eliminar y el Id del Usuario que modifico el registro.
        /// </remarks>
        /// <param name="Id">Id es el parametro mediante el cual se encuentra el registro a eliminar.</param>
        /// <param name="Mod">Mod es el Id del Usuario que modifica el registro</param>
        /// <response code="200">Success. Los valores son correctos y se han agregado exitosamente.</response>
        /// <response code="401">Unauthorized. No se ha indicado o es incorrecto el Token JTW de acceso.</response>
        /// <response code="400">Bad Request. La informacion ingresada no es la correcta o el proceso no existe.</response>
        [HttpDelete("Delete/{Id}")]
        public IActionResult Delete(int Id, int Mod)
        {
            var ModUser = Mod;
            var IdUser = Id;
            var result = _catalogServices.DeleteDepartments(IdUser, ModUser);
            return Ok(result);
        }
    }
}
