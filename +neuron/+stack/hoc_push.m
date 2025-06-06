function hoc_push(value)
% Push a double, string, Vector, Object or NrnRef to the NEURON stack.
%   hoc_push(value)
    if isa(value, "logical")
        neuron_api('nrn_double_push', double(value));
    elseif isa(value, "double")
        neuron_api('nrn_double_push', value);
    elseif isa(value, "string") || isa(value, "char")
        neuron_api('nrn_str_push', value);
    elseif isa(value, "neuron.Object")
        neuron_api('nrn_object_push', value.obj);
    elseif isa(value, "neuron.NrnRef")
        if strcmp(value.ref_class, "Vector")
            neuron_api('nrnref_vector_push', value.obj);
        elseif strcmp(value.ref_class, "Symbol")
            neuron_api('nrnref_symbol_push', value.obj);
        elseif strcmp(value.ref_class, "ObjectProp")
            neuron_api('nrnref_property_push', value.obj);
        elseif strcmp(value.ref_class, "RangeVar")
            neuron_api('nrnref_rangevar_push', value.obj);
        end
    elseif isa(value, "clib.type.nullptr")
        neuron_api('nrn_object_push', clib.type.nullptr);
    else
        error("Input of type "+class(value)+" not allowed.");
    end
end