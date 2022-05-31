'use strict';
var fetch = require('node-fetch');
/**
 * Read the documentation (https://strapi.io/documentation/developer-docs/latest/development/backend-customization.html#core-controllers)
 * to customize this controller
 */

module.exports = {
    apiPage: async (ctx) =>{

        try {
           const response =await fetch('https://g23-finalproject.herokuapp.com/members');
           const data =await response.json();
           console.log('apiMembersPage',data);
          return await ctx.render('apiMember/index', { data });
        } catch (err) {
          console.log('Errors on getting members!');
          return await ctx.render('apiMember/index', { data: '' });
        }
},
apiAddPage:async(ctx)=>{
    return  await  ctx.render('apiMember/add',{
        name:'',
        phone:'',
        email:'',
      });
},
apiAdd:async(ctx)=>{
      // res.send('Add a new book.');
  const name =ctx.request.body.name;
  const phone=ctx.request.body.phone;
  const email=ctx.request.body.email;
  console.log(name,phone,email);

const form_data ={
  name: name,
  phone: phone,
  email: email,
}
try{
  /*await db.query('INSERT INTO member SET ?',form_data);*/
  const response = await fetch('https://g23-finalproject.herokuapp.com/members',{
            method:'post',
            body:JSON.stringify(form_data),
            headers:{'Content-Type':'application/json'},
        })
        const data = await response.json();
  return await ctx.redirect('/apiMembers')
} catch(err){
  console.log(err),
     res.render('apiMember/add',{
      name:form_data.name,
      phone:form_data.phone,
      email:form_data.email,
});
}
},
apiEditPage:async(ctx) =>{
    const id = ctx.params.id;
    try{
      //const [rows] =await db.query('Select * from member WHERE id = ?',[id]);
      const response = await fetch(`https://g23-finalproject.herokuapp.com/members/${id}`);
          const data = await response.json(); 
       return await ctx.render('apiMember/edit',{
        id:data.id,
        name: data.name,
        phone:data.phone,
        email:data.email,
      });
    }catch (err){
        console.log(err);
      }
},
apiUpdate:async(ctx)=>{
    const name = ctx.request.body.name;
  const phone = ctx.request.body.phone;
  const email = ctx.request.body.email;
  const id = ctx.request.body.id;
  const form_data ={
    name: name,
    phone: phone,
    email: email,
  }
  try{
    const response = await fetch(`https://g23-finalproject.herokuapp.com/members/${id}`,{
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
    return await ctx.redirect('/apiMembers');
  }catch (err){
    console.log(err);
  }
},
apiDelete:async(ctx)=>{
    let id = ctx.params.id;

  try {
    const response = await fetch(`https://g23-finalproject.herokuapp.com/members/${id}`,{
            method:'delete',
            
        })
    //await db.query('DELETE FROM member WHERE id = ?', [id]);
  } catch (err) {
    console.log(err);
  }
  return await ctx.redirect('/apiMembers');
}
};
