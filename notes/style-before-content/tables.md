```html
<table>
  <caption>Science fiction books</caption>
  <thead>
    <tr>
      <th scope="col">Title</th>
      <th scope="col">Author</th>
      <th scope="col">Quantity</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Ender's Game</td>
      <td>Orson Scott Card</td>
      <td>10</td>
    </tr>
    <tr>
      <td>A Fire Upon the Deep</td>
      <td>Vernor Vinge</td>
      <td>10</td>
    </tr>
  </tbody>
  <tfoot>
    <tr>
      <td colspan="2">Total</td>
      <td>20</td>
    </tr>
  </tfoot>
</table>
```

Example for minimal styling for tables: https://github.com/mdn/learning-area/blob/master/html/tables/basic/minimal-table.css

```css
table {
  border-collapse: collapse;
}
```
