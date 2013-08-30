ADDRESS_FIELDS = ["firstname", "lastname", "company", "address1", "address2", "city", "state", "zipcode", "country", "phone"]

# The following map of Autocomplete tokens is needed to map our
# address values to correct Browser values that are commonly
# accepted in all major browser versions, the autocomplete feature 
# was introduced formally in the HTML5 #spec, but it was adopted 
# beforehand by some vendors, lastpass also is able to recognize 
# this values and autocomplete the fields with data previously 
# entered or profiles saved.
# For more info please visit the wiki page for the autocomplete spec
# http://wiki.whatwg.org/wiki/Autocompletetype#Supported_Tokens

AUTOCOMPLETE = {
  :firstname         => 'given-name',
  :lastname          => 'family-name',
  :address1          => 'address-line1',
  :address2          => 'address-line2',
  :city              => 'locality',
  :zipcode           => 'postal-code',
  :phone             => 'tel',
  :state_name        => 'region',
  :alternative_phone => 'tel',
  :state_id          => 'region',
  :country_id        => 'country-name',
  :company           => 'organization',
}