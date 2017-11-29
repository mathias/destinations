# Departures and Arrivals

An entry to the 2017 NaNoGenMo. A novel about all the people passing through LAX on a given day.

## Journal:

### 2017/11/24 8AM:

I begin by making a new Ruby project. At the top of the script, I'm copying in the [list of airports from the LAX website](http://www.lawa.org/LAXAirlines.aspx) and formatting it into Ruby arrays so that I can use that later as a data source. I also note the abbreviation 'TBIT' everywhere, apparently that stands for 'Tom Bradley International Terminal' so I decide that I'll have an array of expansions that I can apply randomly to expand acronyms.

### 2017/11/24 9:15AM:

Added in some more data, including the total number of passengers for domestic and international flights in September 2017, so that I can calculate percentages that a passenger is on an international or domestic flight and procedurally generate. (based on http://www.lawa.org/uploadedfiles/LAX/statistics/tcom-0917.pdf )

I also grabbed a list of departure cities for LAX from Wikpedia (https://en.wikipedia.org/wiki/Los_Angeles_International_Airport#Airlines_and_destinations) and spent way too much time formatting the table into Ruby arrays and strings.

### 2017/11/24 11:00AM:

Started classes for both domestic and international passengers and started adding attributes to them. I also started outputting sample stories even though I think ultimately, I'll have it generate all the attributes and then pick randomly from several different story templates for each type (domestic or international)

There's quite a few more details I want to procedurally generate yet, including whether the person is traveling alone or not. I also want it to decide if they have a layover (or time until their flight) and whether the person goes and does something: goes shopping (and what they buy or don't buy), eat at a restaurant, get coffee, read, sleep, etc.

My data didn't work out perfectly -- I really should have separated DESTINATIONS into DOMESTIC_DESTINATIONS and INTERNATIONAL_DESTINATIONS, so that I could avoid having people "traveling domestically going to Dubai". But the data from Wikipedia wasn't split up this way, and I don't want to do all the manual work to separate out the domestic destinations from the list.

Example story at this point: (one for interational and one for domestic, to illustrate):

>  Eliseo Purdy is a domestic passenger. She is from Idaho. She is leaving from LAX to go to Manchester (UK). Eliseo Purdy is traveling to visit family.
>
>  Eleanora Wisoky is an international passenger. He is a citizen of Madagascar. Arriving from Monterrey on Aeroméxico Connect. Going to León/Del Bajío on Aeroméxico Connect.

### 2017/11/25 10:00AM:

I spent anouther hour on this, this morning. I did the work to break out domestic destinations and domestic airlines, but I didn't try to map them 1:1 -- basically, any domestic passenger can take any domestic airline to anywhere in the US, right now. That seems fine. I don't need it to be 100% accurate.

I also added in a little bit of logic over whether they have a layover, if they do, whether they've got a long layover, a short one, or they've missed their flight.

There feels like a lot of room for improvement. Each passenger's story is still only around 40 words per passenger, and they are very repetitive. I also think the code isn't super great, since it there's only a little re-use between the classes, and a lot of arbitrary attributes generated and used. It'd be nice if it all was built more like a decision tree, but I don't want to make one function/method with a giant if-else nested mess.

### 2017/11/28 7:30PM:

Running out of time to work on this. I added in ground transportation for passengers that are arriving and not connecting to another flight.

Overall, these aren't very compelling stories, but the generator does work. Example output:

> Mr. Hilbert Jacobi is a domestic passenger. She is from Minnesota. She is connecting through LAX, coming from Houston and headed to Chicago–Midway. She has an incredibly long layover of 20 hours. Perhaps there is an open restaurant to eat at?
> Ms. Lizeth Smitham is an international passenger. She is a citizen of Tokelau. Arriving from Riyadh on Saudia. Going to Jeddah. She has to wait for a bus between terminals. Why won't anyone help them find where to go? She has an incredibly long layover of 19 hours.
> Solon Cummerata is a domestic passenger. She is from Hawaii. She is arriving from Baltimore. She is traveling on a vacation. She is sunburned. She is is going to take the FlyAway bus from the airport.

## License:

Copyright (c) 2013 Matt Gauger

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
