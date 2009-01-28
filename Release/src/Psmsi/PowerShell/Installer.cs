// Installs Cmdlets into PowerShell.
//
// Author: Heath Stewart <heaths@microsoft.com>
// Created: Thu, 01 Feb 2007 08:14:04 GMT
//
// Copyright (C) Microsoft Corporation. All rights reserved.
//
// THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
// KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
// PARTICULAR PURPOSE.

using System;
using System.ComponentModel;
using System.Configuration.Install;
using System.IO;
using System.Management;
using System.Management.Automation;
using Microsoft.Windows.Installer.PowerShell;
using Microsoft.Windows.Installer.Properties;

namespace Microsoft.Windows.Installer.PowerShell
{
    /// <summary>
    /// Installer class for installutil-supported installation.
    /// </summary>
    /// <remarks>
    /// The snap-in should be installed using Windows Installer or imported as a module.
    /// </remarks>
    [RunInstaller(true)]
    public sealed class WindowsInstallerSnapIn : PSSnapIn
    {
        public override string Name { get { return "psmsi"; } }

        public override string Vendor { get { return Properties.Resources.SnapIn_Vendor; } }
        public override string VendorResource
        {
            get
            {
                return "Microsoft.Windows.Installer.Properties.Resources,SnapIn_Vendor";
            }
        }

        public override string Description { get { return Properties.Resources.SnapIn_Description; } }
        public override string DescriptionResource
        {
            get
            {
                return "Microsoft.Windows.Installer.Properties.Resources,SnapIn_Description";
            }
        }

        public override string[] Formats
        {
            get
            {
                string[] formats = { "formats.ps1xml" };
                return formats;
            }
        }

        public override string[] Types
        {
            get
            {
                string[] types = { "types.ps1xml" };
                return types;
            }
        }
    }
}
