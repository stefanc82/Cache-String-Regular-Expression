/// A class to illustrate the use of StringRgx
Class Examples.StringRgx.Person Extends %Persistent
{

Property Name As %String(MAXLEN = 40) [ Required ];

Property Surname As %String(MAXLEN = 100) [ Required ];

/// SSN/ID Number. MAXLEN used, but can be omitted and only the REGEX can be used.
Property IdentityNumber As MasterLib.DataTypes.StringRgx(MAXLEN = 20, REGEX = "^\d+$");

Storage Default
{
<Data name="PersonDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>Surname</Value>
</Value>
<Value name="4">
<Value>IdentityNumber</Value>
</Value>
</Data>
<DataLocation>^Examples.StringRgx.PersonD</DataLocation>
<DefaultData>PersonDefaultData</DefaultData>
<IdLocation>^Examples.StringRgx.PersonD</IdLocation>
<IndexLocation>^Examples.StringRgx.PersonI</IndexLocation>
<StreamLocation>^Examples.StringRgx.PersonS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
