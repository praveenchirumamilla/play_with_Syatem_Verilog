program test;

  //No object exists for this class
  virtual class proxy_base;
    virtual function proxy_base create_object(string type_name);
      return null;
    endfunction

    pure virtual function string get_typename();
  endclass

  // Factory class
  class factory;
    static proxy_base registry[string];
    static factory me = get();

    // creates only one object
    static function factory get();
      if(me == null)
        me = new();
      return me;
    endfunction

    // register in the factory
    function void register(proxy_base proxy);
      registry[proxy.get_typename()] = proxy;
    endfunction

    // create obj by type
    function proxy_base create_obj_by_type(proxy_base proxy, string name);
      proxy = find_override(proxy);
      return proxy.create_object(name);
    endfunction

    static string override[string];
    static function void override_type(string type_name, override_type_name);
      override[type_name] = override_type_name;
    endfunction

    function proxy_base find_override(proxy_base proxy);
      if(override.exists(proxy.get_typename()))
        return registry[override[proxy.get_typename()]];
      return proxy;
    endfunction

  endclass

endprogram
