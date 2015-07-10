function obj = getSchema
persistent schemaObject
if isempty(schemaObject)
    schemaObject = dj.Schema(dj.conn, 'common', 'madineh_common');
end
obj = schemaObject;
end
