# DateHelper
These class contains these methods:

## From Date object to String
- **fromDateToStringYYYYMMDD** : format date object to YYYY-MM-DD string;
- **fromDateToStringUTC** : format date object to YYYY-MM-DD HH:mm:ss string applying GMT timezone;
- **fromDateToStringGG_MMMM_AAAA** : format date object to DD MMMM YYYY string;
- **fromDateToStringGG_MMM_AAAA** : frmat date object to DD MMM YYYY string;
- **fromDateToStringGGMMAAAA** : format date object to DD/MM/YYYY string;
- **fromDateToStringGGMMAAAA_HHMM** : format date object to DD/MM/YYYY HH:mm string;
- **fromDateToTimeString** : format date object to HH:mm string;
- **fromSecondsToHH_MM_SS** : format date object to HH:mm:ss string;

## From String to Date object
- **fromStringUTCToDate** : parse string formatted as YYYY-MM-DD HH:mm:ss applying GMT timezone to Date object;
- **fromStringISOToDate** : parse string formatted as YYYY-MM-DD HH:mm:ss to Date object;

