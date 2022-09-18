
--  Drop
DROP DATABASE PublicLibrary;
GO

-- Create Data
CREATE DATABASE PublicLibrary;
GO
use PublicLibrary
GO

-- Force Drop

use [master];
GO
ALTER DATABASE PublicLibrary SET OFFLINE WITH ROLLBACK IMMEDIATE;
GO
ALTER DATABASE PublicLibrary SET ONLINE;
GO
DROP DATABASE PublicLibrary;
