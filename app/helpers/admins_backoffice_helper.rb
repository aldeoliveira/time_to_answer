module AdminsBackofficeHelper
  def translate_attribute(object=nil, method=nil)
    if not (object or method)
      "Informe os parâmetros corretamente"
    end

    object.model.human_attribute_name(method)
  end
end
