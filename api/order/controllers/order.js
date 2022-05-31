'use strict';
var fetch = require('node-fetch');
/**
 * Read the documentation (https://strapi.io/documentation/developer-docs/latest/development/backend-customization.html#core-controllers)
 * to customize this controller
 */

module.exports = {
    apiPage: async (ctx) =>{

        try {
           const response =await fetch('https://g23-finalproject.herokuapp.com/orders');
           const data =await response.json();
           console.log('apiPage',data);
          return await ctx.render('apiOrder/index', { data });
        } catch (err) {
          console.log('Errors on getting orders!');
          return await ctx.render('apiOrder/index', { data: '' });
        }
},
apiAddPage:async(ctx)=>{
    return  await  ctx.render('apiOrder/add',{
        member:'',
        product:'',
        area:'',
      });
},
apiAdd:async(ctx)=>{
      // res.send('Add a new book.');
  const member =ctx.request.body.member;
  const product=ctx.request.body.product;
  const area=ctx.request.body.area;
  console.log(member,product,area);

const form_data ={
    member:  member,
    product: product,
    area: area,
}
try{
  /*await db.query('INSERT INTO member SET ?',form_data);*/
  const response = await fetch('https://g23-finalproject.herokuapp.com/orders',{
            method:'post',
            body:JSON.stringify(form_data),
            headers:{'Content-Type':'application/json'},
        })
        const data = await response.json();
  return await ctx.redirect('/apiOrders')
} catch(err){
  console.log(err),
     res.render('apiOrders/add',{
        member:form_data.member,
        product:form_data.product,
        area:form_data.area,
});
}
},
apiEditPage:async(ctx) =>{
    const id = ctx.params.id;
    try{
      //const [rows] =await db.query('Select * from member WHERE id = ?',[id]);
      const response = await fetch(`https://g23-finalproject.herokuapp.com/orders/${id}`);
          const data = await response.json(); 
       return await ctx.render('apiOrder/edit',{
        id:data.id,
        member: data.member,
        product:data.product,
        area:data.area,
      });
    }catch (err){
        console.log(err);
      }
},
apiUpdate:async(ctx)=>{
    const  member = ctx.request.body.member;
  const product = ctx.request.body.product;
  const area = ctx.request.body.area;
  const id = ctx.request.body.id;
  const form_data ={
    member:  member,
    product: product,
    area: area,
  }
  try{
    const response = await fetch(`https://g23-finalproject.herokuapp.com/orders/${id}`,{
            method:'put',
            body:JSON.stringify(form_data),
            headers:{'Content-Type':'application/json'},
        })
    /*await db.query('UPDATE member SET name = ?, phone = ? ,email = ? WHERE id = ?',
    [
      name,
      phone,
      email,
      id,
    ]);*/
    // res.status(200).json({ message:'Updating successful'});
    return await ctx.redirect('/apiOrders');
  }catch (err){
    console.log(err);
  }
},
apiDelete:async(ctx)=>{
    let id = ctx.params.id;

  try {
    const response = await fetch(`https://g23-finalproject.herokuapp.com/orders/${id}`,{
            method:'delete',
            
        })
    //await db.query('DELETE FROM member WHERE id = ?', [id]);
  } catch (err) {
    console.log(err);
  }
  return await ctx.redirect('/apiOrders');
}
};
