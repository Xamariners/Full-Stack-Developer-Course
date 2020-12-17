using System;
using System.Collections.Generic;
using XamarinUniversity.Interfaces;

namespace GreatQuotes.UnitTests.Stubs
{
    public class DependencyServiceStub : IDependencyService
    {
        readonly Dictionary<Type, object> registeredServices = new Dictionary<Type, object>();

        public void Register<T>(object impl)
        {
            this.registeredServices[typeof(T)] = impl;
        }

        public T Get<T> () where T:class
        {
            return (T)registeredServices[typeof(T)];
        }

        public void Register<T>() where T : class, new()
        {
            this.registeredServices[typeof(T)] = new T();
        }

        void IDependencyService.Register<T, TImpl>()
        {
            this.registeredServices[typeof(T)] = new TImpl();
        }

        public void Register<T>(T impl) where T : class
        {
            this.registeredServices[typeof(T)] = impl;
        }
    }
}