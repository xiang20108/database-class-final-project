'use strict';
var fetch = require('node-fetch');
/**
 * Read the documentation (https://strapi.io/documentation/developer-docs/latest/development/backend-customization.html#core-controllers)
 * to customize this controller
 */

module.exports = {
  productpage: async(ctx)=> {
    let data,brand;
    try {
      data = await strapi.services.product.find();
      brand = await strapi.services.brand.find();
      return await ctx.render('product',{
        data,
        brand,
        title:"All Product"
      });
    } catch (err) {
      console.log(err);
    }
  },

    apiPage: async (ctx) =>{
        try {
           const response =await fetch('https://g23-finalproject.herokuapp.com/products');
           const data =await response.json();
           console.log('apiPage',data);
          return await ctx.render('apiProduct/index', { data });
        } catch (err) {
          console.log('Errors on getting products!');
          return await ctx.render('apiProduct/index', { data: '' });
        }
},
apiAddPage:async(ctx)=>{
    return  await  ctx.render('apiProduct/add',{
        name:'',
        price:'',
        remote_url:'',
        local_url:'',
        category:'',
        brand:'',
      });
},
apiAdd:async(ctx)=>{
  const name =ctx.request.body.name;
  const price =ctx.request.body.price;
  const remote_url=ctx.request.body.remote_url;
  const local_url=ctx.request.body.local_url;
  const category=ctx.request.body.category;
  const brand=ctx.request.body.brand;
  console.log(name,price,remote_url,local_url,category,brand);

const form_data ={
  name: name,
  price: price,
  remote_url: remote_url,
  local_url:local_url,
  category:category,
  brand:brand,
}
try{
  const response = await fetch('https://g23-finalproject.herokuapp.com/products',{
            method:'post',
            body:JSON.stringify(form_data),
            headers:{'Content-Type':'application/json'},
        })
        const data = await response.json();
  return await ctx.redirect('/apiProducts')
} catch(err){
  console.log(err),
     res.render('apiProduct/add',{
      name:form_data.name,
      price:form_data.price,
      remote_url:form_data.remote_url,
      local_url:form_data.local_url,
      category:form_data.category,
      brand:form_data.brand,
});
}
},
apiEditPage:async(ctx) =>{
    const id = ctx.params.id;
    try{
      //const [rows] =await db.query('Select * from member WHERE id = ?',[id]);
      const response = await fetch(`https://g23-finalproject.herokuapp.com/products/${id}`);
          const data = await response.json(); 
       return await ctx.render('apiProduct/edit',{
        id:data.id,
        name: data.name,
        remote_url:data.remote_url,
        local_url:data.local_url,
        price:data.price,
        category:data.category,
        brand:data.brand,
        order:data.order,
      });
    }catch (err){
        console.log(err);
      }
},
apiUpdate:async(ctx)=>{
  const name = ctx.request.body.name;
  const remote_url = ctx.request.body.remote_url;
  const local_url = ctx.request.body.local_url;
  const price = ctx.request.body.price;
  const id = ctx.request.body.id;
  const order = ctx.request.body.order;
  const category =ctx.request.body.category;
  const brand =ctx.request.body.brand;
  const form_data ={
    name: name,
    price: price,
    remote_url: remote_url,
    local_url:local_url,
    category:category,
    brand:brand,
  }
  try{
    const response = await fetch(`https://g23-finalproject.herokuapp.com/products/${id}`,{
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
    return await ctx.redirect('/apiProducts');
  }catch (err){
    console.log(err);
  }
},
apiDelete:async(ctx)=>{
    let id = ctx.params.id;

  try {
    const response = await fetch(`https://g23-finalproject.herokuapp.com/products/${id}`,{
            method:'delete',
            
        })
    //await db.query('DELETE FROM member WHERE id = ?', [id]);
  } catch (err) {
    console.log(err);
  }
  return await ctx.redirect('/apiProducts');
}
};
