# quartus-mister

Quartus Lite 17.02 Docker for MiSTer core development.

Since MiSTer has standardized on Quartus 17.0, this installs that version with support for the Cyclone V FPGA on the DE10-Nano board used by the MiSTer project.

There is an included a `quartus` shell script, which allows execution of quartus commands (like `quartus_sh`) from inside the docker container. Just copy  the `quartus` shell script to a directory in your `PATH`. 

For example, the following command can be used to compile the project associated with `my.qpf`:
```
quartus quartus_sh --flow compile my.qpf
```
Here the `quartus_sh` command is executed with the options `--flow compile my.qpf`. The current working directory is mounted to `/build` in the container, which is where `quartus_sh` will look for `my.qpf`. 


Optional Environment variables:
- `JTAG_SERVER`: allows setting a server for remote programming
- `JTAG_PASSWD`: allows setting a server password for remote programming
