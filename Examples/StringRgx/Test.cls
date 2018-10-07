/// Basic positive and negative tests on the regular expression
Class Examples.StringRgx.Test [ ProcedureBlock ]
{

/// set sc = ##class(Examples.StringRgx.Test).TestPositive()
ClassMethod TestPositive() As %Status
{
	set sc = $$$OK
	try
	{
		set tPerson = ##class(Examples.StringRgx.Person).%New()
		set tPerson.Name = "John"
		set tPerson.Surname = "Smith"
		set tPerson.IdentityNumber = "6910050081005"
		set sc = tPerson.%ValidateObject()
		if ($$$ISERR(sc)) {
			throw
		}
		write "Test passed"
	} catch tEx {
		set:(sc=$$$OK) sc = tEx.AsStatus()
		write "Test failed: " _ $System.Status.GetErrorText(sc)
	}
	kill tPerson
	quit sc
}

/// set sc = ##class(Examples.StringRgx.Test).TestNegative()
ClassMethod TestNegative() As %Status
{
	set sc = $$$OK
	try
	{
		set tPerson = ##class(Examples.StringRgx.Person).%New()
		set tPerson.Name = "John"
		set tPerson.Surname = "Smith"
		set tPerson.IdentityNumber = "6910050081005A"
		set sc = tPerson.%ValidateObject()
		if ('$$$ISERR(sc)) {
			throw ##class(%Exception.General).%New("Validation", 99999,"TestNegative",tPerson.IdentityNumber)
		}
		write "Test passed"
	} catch tEx {
		set:(sc=$$$OK) sc = tEx.AsStatus()
		write "Test failed: " _ $System.Status.GetErrorText(sc)
	}
	kill tPerson
	quit sc
}

}
