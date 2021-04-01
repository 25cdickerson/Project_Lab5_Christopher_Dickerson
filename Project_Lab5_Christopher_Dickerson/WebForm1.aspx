<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Project_Lab5_Christopher_Dickerson.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="Lab5_2_SqlDataSource1" runat="server"></asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="InventoryID" DataSourceID="Lab5_SqlDataSource1" Width="593px">
                <Columns>
                        <asp:BoundField DataField="InventoryID" HeaderText="InventoryID" InsertVisible="False" ReadOnly="True" SortExpression="InventoryID" />
                        <asp:BoundField DataField="SupplierID" HeaderText="SupplierID" SortExpression="SupplierID" />
                        <asp:BoundField DataField="Item" HeaderText="Item" SortExpression="Item" />
                        <asp:BoundField DataField="UnitsInStock" HeaderText="UnitsInStock" SortExpression="UnitsInStock" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="Lab5_SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Lab5_ConnectionString %>" SelectCommand="SELECT * FROM [Inventory]"></asp:SqlDataSource>
        </div>
        <asp:TextBox ID="TextBox1" runat="server" Width="207px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Enter Valid Number" Forecolor="Red" Type="Integer" Font-Bold="true" Display="Dynamic"><span>*</span></asp:RequiredFieldValidator>
        <asp:Button ID="Button1" runat="server" Text="Get Reordered List" />
        <br />
        <asp:label runat="server" ID="Label2" Visible="false" />
        <asp:GridView ID="GridView2" runat="server" Visible="False" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Item" HeaderText="Item" SortExpression="Item" />
                <asp:BoundField DataField="CompanyName" HeaderText="CompanyName" SortExpression="CompanyName" />
                <asp:BoundField DataField="UnitsInStock" HeaderText="UnitsInStock" SortExpression="UnitsInStock" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Lab5_ConnectionString %>" SelectCommand="SELECT Inventory.Item, Supplier.CompanyName, Inventory.UnitsInStock FROM Inventory INNER JOIN Supplier ON Inventory.SupplierID = Supplier.SupplierID WHERE (Inventory.UnitsInStock &lt;= @quantity)">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" DefaultValue="0" Name="quantity" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
