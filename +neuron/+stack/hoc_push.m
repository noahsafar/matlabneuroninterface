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
        neuron_api('nrn_double_ptr_push', value.obj);
    elseif isa(value, "clib.type.nullptr")
        error("Functionality not implemented.");
        neuron_api('nrn_object_push', clib.type.nullptr);
    else
        error("Input of type "+class(value)+" not allowed.");
    end
end