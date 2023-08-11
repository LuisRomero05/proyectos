﻿using AHM.Logistic.Smart.Api.Extensions;
using AHM.Logistic.Smart.Api.TestControllers;
using AHM.Logistic.Smart.BusinessLogic;
using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Moq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AHM.Logistic.Smart.Unit.Test.Controllers
{
    [TestClass]
    public class CallBusinessControllerShould
    {
        private static IMapper _mapper;

        public CallBusinessControllerShould()
        {
            if (_mapper == null)
            {
                var mappingConfig = new MapperConfiguration(mc =>
                {
                    mc.AddProfile(new MappingProfileExtensions());
                });
                IMapper mapper = mappingConfig.CreateMapper();
                _mapper = mapper;
            }
        }
        protected Mock<IMapper> map = new Mock<IMapper>();
        CallBusinessControllerTest callBusinessControllerTest;
        [TestInitialize]
        public void Initalize()
        {
            callBusinessControllerTest = new CallBusinessControllerTest(_mapper);
        }

        [TestMethod]
        public void ShowcallBusinessList()
        {
            OkObjectResult result = (OkObjectResult)callBusinessControllerTest.List();
            int Code = (int)result.StatusCode;
            ServiceResult srv = (ServiceResult)result.Value;
            //ObjectResultController obr = new ObjectResultController() 
            //{ 
            //    ContentTypes = result.ContentTypes,
            //};
            Assert.IsNotNull(result);
        }

        [TestMethod]
        public void ShowcallBusinessListFail()
        {
            OkObjectResult result = (OkObjectResult)callBusinessControllerTest.List();
            int Code = (int)result.StatusCode;
            ServiceResult srv = (ServiceResult)result.Value;
            //ObjectResultController obr = new ObjectResultController() 
            //{ 
            //    ContentTypes = result.ContentTypes,
            //};
            Assert.AreEqual(400, Code);
        }

    }
}
