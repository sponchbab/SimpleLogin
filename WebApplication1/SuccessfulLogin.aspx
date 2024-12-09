<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SuccessfulLogin.aspx.cs" Inherits="WebApplication1.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Successful Login</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p>Successful Login</p>
            <br />
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="ID,User_id" DataSourceID="UserPassword" DefaultMode="Edit" OnPageIndexChanging="FormView1_PageIndexChanging">
                <EditItemTemplate>
                    Name:
                    <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                    <br />
                    Last_Name:
                    <asp:TextBox ID="Last_NameTextBox" runat="server" Text='<%# Bind("Last_Name") %>' />
                    <br />
                    <br />
                    User_id:
                    <asp:Label ID="User_idLabel1" runat="server" Text='<%# Eval("User_id") %>' />
                    <br />
                    PlainTextPassword:
                    <asp:TextBox ID="PlainTextPasswordTextBox" runat="server" Text='<%# Bind("PlainTextPassword") %>' />
                    <asp:Button ID="hash" runat="server" OnClick="hash_Click" Text="Hash Password" BackColor="#CCFFCC"/>
                    <br />
                    HashedPassword:
                    <asp:TextBox ID="HashedPasswordTextBox" runat="server" Text='<%# Bind("HashedPassword") %>' Width="279px" />
                    <br />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    Name:
                    <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                    <br />
                    Last_Name:
                    <asp:TextBox ID="Last_NameTextBox" runat="server" Text='<%# Bind("Last_Name") %>' />
                    <br />
                    User_id:
                    <asp:TextBox ID="User_idTextBox" runat="server" Text='<%# Bind("User_idTextBox") %>' />
                    <br />
                    PlainTextPassword:
                    <asp:TextBox ID="PlainTextPasswordTextBox" runat="server" Text='<%# Bind("PlainTextPassword") %>' />
                    <br />
                    HashedPassword:
                    <asp:TextBox ID="HashedPasswordTextBox" runat="server" Text='<%# Bind("HashedPassword") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    ID:
                    <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                    <br />
                    Name:
                    <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' />
                    <br />
                    Last_Name:
                    <asp:Label ID="Last_NameLabel" runat="server" Text='<%# Bind("Last_Name") %>' />
                    <br />
                    User_id:
                    <asp:Label ID="User_idLabel" runat="server" Text='<%# Eval("User_id") %>' />
                    <br />
                    PlainTextPassword:
                    <asp:Label ID="PlainTextPassword" runat="server" Text='<%# Bind("PlainTextPassword") %>' />
                    <br />
                    HashedPassword:
                    <asp:Label ID="HashedPassword" runat="server" Text='<%# Bind("HashedPassword") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="UserPassword" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" DeleteCommand="DELETE FROM [user_data] WHERE [ID] = ? AND [User_id] = ?" InsertCommand="INSERT INTO [user_data] ([ID], [Name], [Last_Name], [User_id], [PlainTextPassword], [HashedPassword]) VALUES (?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT * FROM [user_data] WHERE ([ID] = ?)" UpdateCommand="UPDATE [user_data] SET [Name] = ?, [Last_Name] = ?, [PlainTextPassword] = ?, [HashedPassword] = ? WHERE [ID] = ? AND [User_id] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                    <asp:Parameter Name="User_id" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Last_Name" Type="String" />
                    <asp:Parameter Name="User_id" Type="String" />
                    <asp:Parameter Name="PlainTextPassword" Type="String" />
                    <asp:Parameter Name="HashedPassword" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="ID" SessionField="UID" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Last_Name" Type="String" />
                    <asp:Parameter Name="PlainTextPassword" Type="String" />
                    <asp:Parameter Name="HashedPassword" Type="String" />
                    <asp:Parameter Name="ID" Type="Int32" />
                    <asp:Parameter Name="User_id" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
        </div>
        <p>
            Here are you access levels:</p>
        <p>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID,User_id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:CheckBoxField DataField="Admin" HeaderText="Admin" SortExpression="Admin" />
                    <asp:CheckBoxField DataField="Programmer" HeaderText="Programmer" SortExpression="Programmer" />
                    <asp:CheckBoxField DataField="User" HeaderText="User" SortExpression="User" />
                    <asp:BoundField DataField="User_id" HeaderText="User_id" ReadOnly="True" SortExpression="User_id" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString3 %>" ProviderName="<%$ ConnectionStrings:ConnectionString3.ProviderName %>" SelectCommand="SELECT * FROM [user_access] WHERE ([User_id] = ?)">
                <SelectParameters>
                    <asp:SessionParameter Name="User_id" SessionField="USERID" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
    </form>
</body>
</html>
