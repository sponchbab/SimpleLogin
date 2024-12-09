<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome to Matt's Login</title>

    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <script>
        window.addEventListener('pageshow', function (event) {
            var form = document.getElementById("form1");
            form.reset();
        });
    </script>
    
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p>Welcome to Matt's Login</p>
            <asp:Label ID="UserLabel" runat="server" Text="User"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="User" runat="server" MaxLength="10"></asp:TextBox>
            <asp:RequiredFieldValidator ID="UsernameValidator" runat="server" ErrorMessage="Username is required" ControlToValidate="User"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="PasswordLabel" runat="server" Text="Password"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Password" runat="server" TextMode="Password" MaxLength="20"></asp:TextBox>
            <asp:RequiredFieldValidator ID="PasswordValidator" runat="server" ErrorMessage="Password is required" ControlToValidate="Password"></asp:RequiredFieldValidator>
            <br />
            <br />
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="LoginButton" runat="server" Text="Login" OnClick="Login_OnClick"/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="MessageLabel" runat="server"></asp:Label>
            <br />
            <br />
            <br />
            <asp:SqlDataSource ID="UserLogin" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [ID], [User_id], [PlainTextPassword] FROM [user_data] WHERE ([User_id] = ?)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="User" Name="User_id" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />

        </div>
    </form>
</body>
</html>
