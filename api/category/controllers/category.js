'use strict';
var fetch = require('node-fetch');
/**
 * Read the documentation (https://strapi.io/documentation/developer-docs/latest/development/backend-customization.html#core-controllers)
 * to customize this controller
 */

module.exports = {
  homepage: async (ctx) => {
    let category,brand;
    category = await strapi.services.category.find();
    brand = await strapi.services.brand.find();
    // console.log("entities", entities);
    return await ctx.render("shop", {
      data:category,
      brand,
      title: "Computer Peripherals",
    });
  },
  categorypage: async (ctx) => {
    let brand,entities,data,cname;
    try{
      cname = ctx.params.cname;
      brand = await strapi.services.brand.find();
      entities = await strapi.services.category.findOne({name:cname});
      //console.log("cname",entities);
      if(entities){
        data = entities.products;
      return await ctx.render("product",{
        brand,
        data,
        title:entities.name
      });
      }
      else{
        return await ctx.send("Please import category data!!!");
      }
    }
    catch(err) {
      console.log(err);
    }
  },
    apiPage: async (ctx) =>{

        try {
           const response =await fetch('https://g23-finalproject.herokuapp.com/brands');
           const data =await response.json();
           console.log('apiPage',data);
          return await ctx.render('apiCategory/index', { data });
        } catch (err) {
          console.log('Errors on getting brands!');
          return await ctx.render('apiCategory/index', { data: '' });
        }
},
apiAddPage:async(ctx)=>{

    return await ctx.render('apiBrand/add',{
        name:'',
        remote_url:'',
        local_url:'',
        link_url:''
      });
},
apiAdd:async(ctx)=>{
    const name =ctx.request.body.name;
    const remote_url=ctx.request.body.remote_url;
    const local_url=ctx.request.body.local_url;
    const link_url=ctx.request.body.link_url;
    console.log(name,remote_url,local_url,link_url);

    const form_data ={
        name: name,
        remote_url: remote_url,
        local_url: local_url,
        link_url: link_url,
      };
    try{
        const response = await fetch('https://g23-finalproject.herokuapp.com/brands',{
            method:'post',
            body:JSON.stringify(form_data),
            headers:{'Content-Type':'application/json'},
        })
        const data = await response.json();
        // await db.query('INSERT INTO brands SET ?',form_data);
        return await ctx.redirect('/apiBrands')
      } catch(err){
        console.log(err),
        res.render('apiBrand/add',{
            name:form_data.name,
            remote_url:form_data.remote_url,
            local_url:form_data.local_url,
            link_url:form_data.link_url,
      });
      }      
},
apiEditPage:async(ctx)=>{
    const id = ctx.params.id;
    try{
      const response =await fetch(`https://g23-finalproject.herokuapp.com/brands/${id}`);
      const data =await response.json();
      // const [rows] =await db.query('Select * from brands WHERE id = ?',[id]);
      return await ctx.render('apiBrand/edit',{
        id:data.id,
        name: data.name,
        remote_url:data.remote_url,
        local_url:data.local_url,
        link_url:data.link_url,
      });
    }catch (err){
        console.log(err);
      }
},
apiUpdate:async(ctx)=>{
    const name = ctx.request.body.name;
    const remote_url = ctx.request.body.remote_url;
    const local_url = ctx.request.body.local_url;
    const link_url = ctx.request.body.link_url;
    const id = ctx.request.body.id;
    const form_data ={
        name: name,
        remote_url: remote_url,
        local_url: local_url,
        link_url: link_url,
  }

  try{
    const response = await fetch(`https://g23-finalproject.herokuapp.com/brands/${id}`,{
            method:'put',
            body:JSON.stringify(form_data),
            headers:{'Content-Type':'application/json'},
            })
    // await db.query('UPDATE brands SET name = ?, url = ? WHERE id = ?',[
    //   name,
    //   url,
    //   id,
    // ]);
    // res.status(200).json({ message:'Updating successful'});
    return await ctx.redirect('/apiBrands');
  }catch (err){
    console.log(err);
  }
},
apiDelete:async(ctx)=>{
    let id = ctx.params.id;

    try {
      const response = await fetch(`https://g23-finalproject.herokuapp.com/brands/${id}`,{
              method:'delete',
    })
      // await db.query('DELETE FROM brands WHERE id = ?', [id]);
    } catch (err) {
      console.log(err);
    }
    return await ctx.redirect('/apiBrands');
}
};
