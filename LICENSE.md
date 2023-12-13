#	OS/1337	
## License

TL;DR: it's [0BSD](https://en.wikipedia.org/wiki/BSD_licenses#0-clause_license_(%22BSD_Zero_Clause_License%22)), an [OSI approved](https://opensource.org/license/0bsd/), permissive license.
- For the underlying software please see [LICENSES.md](docu/LICENSES.md) .

---

##### License Text:

````
Copyright © 2023 
by Kevin Karhan <kevin@karhan.guru> 
and Contributors to OS/1337 <admin@os1337.com> 

Permission to use, copy, modify, and/or distribute 
this software for  any purpose with or without fee is hereby granted.



Permission to use, copy, modify, and/or distribute this software for
any purpose with or without fee is hereby granted.

THE SOFTWARE IS PROVIDED “AS IS” AND THE AUTHOR DISCLAIMS ALL
WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES
OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE
FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY
DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN
AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT
OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

````

End of License Text

---

---

# IMPORTANT NOTE:
## This only covers the works as per OS/1337 project and does not apply to all underlying packages!
### [Licenses for underlying packages & software can be found in /docu/LICENSES.md](docu/LICENSES.md).
For details on the build in question, please check the ``source.list.tsv`` for said edition and version.
- I.e. the "``CORE`` *Edition*" comes with ``Linux``, ``syslinux`` ``toybox`` and ``dropbear`` and is built against ``musl-cross``, which means aside Linux (GPLv2) & SYSLINUX (GPLv2+)  [we only have BSD & MIT - like licensed code in it](build/0.CORE/build/sources.list.tsv).
  - Making it easy to comply with said licenses.

###### It is recommended to use public releases and not a git commit stage to make it easy to provide sources and/or enshure reproduceability where applicable, since these will likely be archived and less susceptible to link rot.

- As done so by us and documented in our [LICENSES.md file](docu/LICENSES.md).

#### If in doubt, read the terms of the license and/or consult a licensed lawyer/solicitor/legal advisor in your juristiction to answer specific questions.
### We legally can't and won't provide legal advice - period!

---
